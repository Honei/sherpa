#!/bin/bash
#
# Copyright (c) 2023, NVIDIA CORPORATION. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
onnx_dir=/workspace/icefall/egs/librispeech/ASR/icefall-asr-librispeech-pruned-transducer-stateless7-2022-11-11/exp
model_repo_dir=/workspace/sherpa/triton/zipformer/model_repo_offline
cp $onnx_dir/encoder.onnx $model_repo_dir/encoder/1/encoder.onnx
cp $onnx_dir/decoder.onnx $model_repo_dir/decoder/1/decoder.onnx
cp $onnx_dir/joiner.onnx $model_repo_dir/joiner/1/joiner.onnx
cp $onnx_dir/joiner_encoder_proj.onnx $model_repo_dir/joiner_encoder_proj/1/joiner_encoder_proj.onnx
cp $onnx_dir/joiner_decoder_proj.onnx $model_repo_dir/joiner_decoder_proj/1/joiner_decoder_proj.onnx
cp $onnx_dir/../data/lang_bpe_500/bpe.model /workspace/
# Start server
tritonserver --model-repository=$model_repo_dir --pinned-memory-pool-byte-size=512000000 --cuda-memory-pool-byte-size=0:1024000000 

