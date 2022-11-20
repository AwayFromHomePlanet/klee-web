import os
import re

from worker.processor.base import BaseProcessor
from worker.storage.displayed_types import displayed_type_mappings


class KleeTestCaseProcessor(BaseProcessor):
    name = 'test_cases'
    notify_message = 'Processing test cases'

    def __init__(self, runner, code, args):
        BaseProcessor.__init__(self, runner, args)
        self.code = code
        self.klee_result_dir = os.path.join(runner.tempdir, 'klee-out-0')
        self.docker_result_dir = os.path.join(runner.DOCKER_MOUNT_DIR,
                                              'klee-out-0')

    def process_test_file(self, file_name):
        file_path = os.path.join(self.docker_result_dir, file_name)

        ktest_tool_command = ['ktest-tool', file_path]
        ktest_output = self.runner.run_with_docker(ktest_tool_command)
        return self.parse_ktest(ktest_output)

    def parse_ktest(self, data):
        def get_kv_pairs(strList):
            return [[x.strip(" \n") for x in pair.split(': ', 2)[1:]]
                    for pair in strList]

        data = data.strip().split("\n")
        ktestDesc = data[0:3]
        memObjs = []
        i = 3

        code_file = self.runner.DOCKER_CODE_FILE
        print(code_file)

        user_param_types = self.parse_user_param_types(self.code)

        param_index = 0
        while i < len(data):
            obj = dict(get_kv_pairs(data[i:i + 2]))
            offset = 7 if int(obj["size"]) in [1, 2, 4, 8] else 5
            obj["representations"] = \
                [rep for rep in get_kv_pairs(data[i + 2:i + offset])
                 if rep[0] in displayed_type_mappings[
                     user_param_types[param_index]]]
            memObjs.append(obj)
            i += offset
            param_index += 1
        return {"desc": ktestDesc, "mem_objs": memObjs}

    @staticmethod
    def parse_user_param_types(code):
        params = re.search(r"\s*\(([^)]*)\s*\)\s*\{", code)
        if params:
            params = params.group(1)
            param_list = re.findall(r"\s*(\w+)\s+\w+\s*(?:,|$)", params)
            return param_list

    def process(self):
        ktest_files = filter(lambda f: f.endswith('.ktest'),
                             os.listdir(self.klee_result_dir))
        ktest_files = sorted(ktest_files,
                             key=lambda f: int(re.sub(r'\D', '', f)))
        return list(map(self.process_test_file, ktest_files))
