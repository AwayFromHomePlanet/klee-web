import os
import subprocess
import re

from celery import Celery
from celery.worker.control import Panel
from celery.exceptions import SoftTimeLimitExceeded

from worker.runner import WorkerRunner
from worker.worker_config import WorkerConfig

from worker.storage.challenge_solutions import add_solution_code

celery = Celery(broker=os.environ['CELERY_BROKER_URL'], backend='rpc')

worker_config = WorkerConfig()


@Panel.register
def get_uptime_stats(state):
    uptime_pattern = re.compile(
        r'up\s+(.*?),\s+([0-9]+) '
        r'users?,\s+load averages?: '
        r'([0-9]+\.[0-9][0-9]),?\s+([0-9]+\.[0-9][0-9])'
        r',?\s+([0-9]+\.[0-9][0-9])')

    uptime_output = subprocess.check_output('uptime')
    uptime_matches = uptime_pattern.search(uptime_output)

    return {
        'uptime': uptime_matches.group(1),
        'users': uptime_matches.group(2),
        'loadavg_1min': uptime_matches.group(3),
        'loadavg_5min': uptime_matches.group(4),
        'loadavg_15min': uptime_matches.group(5),
    }


@celery.task(name='submit_code', bind=True)
def submit_code(self, code, filename, email, klee_args, endpoint):
    # name will hold the name of the current worker
    name = self.request.hostname
    with WorkerRunner(self.request.id, endpoint, worker_name=name) as runner:
        try:
            # Use the filename to add solution code if it is a challenge.
            code = add_solution_code(code, filename)
            runner.run(code, email, klee_args)
        except SoftTimeLimitExceeded:
            result = {
                'klee_run': {
                    'output': 'Job exceeded time limit of '
                              '{} seconds'.format(worker_config.timeout)
                }
            }
            runner.send_notification('job_failed', result)
