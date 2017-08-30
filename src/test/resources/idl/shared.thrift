/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/**
 * This Thrift file can be included by other Thrift files that want to share
 * these definitions.
 */

namespace cpp shared
namespace java shared
namespace perl shared

include "dto.thrift"

typedef i16 short
typedef i32 int
typedef i64 long

struct SharedStruct {
  1: i32 key
  2: string value
}

service SharedService {
  SharedStruct getStruct(1: i32 key)
}

service BucketService {

    dto.BucketDTO dispatch(1:int tid, 2:map<string, string> params),

    dto.BucketDTO getMainBucket(1:int tid, 2:int appId),

    list<dto.BucketDTO> getBucketByEngine(1:int tid, 2:int appId, 3:string bucketName)

}

service BucketManageService {

    dto.BoolDTO reload(1:int tid)

}

service BucketDataSyncService {

    dto.BoolDTO crowdSync(1:int tid, 2:int appId, 3:string bucket, 4:string version, 5:list<dto.CrowdDTO> crowds)

}
