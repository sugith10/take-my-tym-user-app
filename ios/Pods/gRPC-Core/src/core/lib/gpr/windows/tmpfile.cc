//
//
// Copyright 2015 gRPC authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//

#include <grpc/support/port_platform.h>

#ifdef GPR_WINDOWS_TMPFILE

#include <io.h>
#include <stdio.h>
#include <string.h>
#include <tchar.h>

#include <grpc/support/alloc.h>
#include <grpc/support/log.h>
#include <grpc/support/string_util.h>

#include "src/core/lib/gpr/tmpfile.h"
#include "src/core/lib/gprpp/crash.h"
#include "src/core/lib/gprpp/tchar.h"

FILE* gpr_tmpfile(const char* prefix, char** tmp_filename_out) {
  FILE* result = NULL;
  TCHAR tmp_path[MAX_PATH];
  TCHAR tmp_filename[MAX_PATH];
  DWORD status;
  UINT success;

  if (tmp_filename_out != NULL) *tmp_filename_out = NULL;

  // Convert our prefix to TCHAR.
  grpc_core::TcharString template_string = grpc_core::CharToTchar(prefix);

  // Get the path to the best temporary folder available.
  status = GetTempPath(MAX_PATH, tmp_path);
  if (status == 0 || status > MAX_PATH) goto end;

  // Generate a unique filename with our template + temporary path.
  success = GetTempFileName(tmp_path, template_string.c_str(), 0, tmp_filename);
  if (!success) goto end;

  // Open a file there.
  if (_tfopen_s(&result, tmp_filename, TEXT("wb+")) != 0) goto end;

end:
  if (result && tmp_filename_out) {
    *tmp_filename_out =
        gpr_strdup(grpc_core::TcharToChar(tmp_filename).c_str());
  }

  return result;
}

#endif  // GPR_WINDOWS_TMPFILE
