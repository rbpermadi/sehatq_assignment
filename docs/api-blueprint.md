FORMAT: 1A
HOST: https://api.sehatq.com/api/v1
# SehatQ Assigment Module API documentation
This is draft version of SehatQ Assigment API version 1. This is a public api.

Designed tightly coupled with SehatQ needs.

# Group Auth
Auth is a representation of authentication process on the system.

### Register [POST /auth]

Register user

+ Request (application/json)
  + Attributes (object)
      + name: `Rojali Budi Permadi` (string, required)
      + email: `rojali@gmail.com` (string, required)
      + password: `12345678` (string, required)
      + password_confirmation: `12345678` (string, required)

+ Response 201 (application/json)
  + Headers
      access-token: `Ucdf5zO3F1fq3f19vpFxUg`
      client: `Y7ms0Hmebg0p4iNMiF8yng`
      uid: `test2@gmail.com`

  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Auth-Response
      + meta (object, required)
          + status: 201 (number, required)

+ Response 422 (application/json)
  + Attributes (object)
      + errors (array[string], required)
          + `Email has already been taken`
      + meta (object, required)
          + status: 422 (number, required)

### SignIn [POST /auth/sign_in]

Signin user

+ Request (application/json)
  + Attributes (object)
      + email: `rojali@gmail.com` (string, required)
      + password: `12345678` (string, required)

+ Response 200 (application/json)
  + Headers
      access-token: `Ucdf5zO3F1fq3f19vpFxUg`
      client: `Y7ms0Hmebg0p4iNMiF8yng`
      uid: `test2@gmail.com`

  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Auth-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 401 (application/json)
  + Attributes (object)
      + errors (array[string], required)
          + `Invalid login credentials. Please try again.`
      + meta (object, required)
          + status: 401 (number, required)


# Group Specialities
Specialities is a representation of speciality on the system.

### List Specialities [GET /specialities]
Returns a list of specialities.
+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Specialities-Response], required)
      + meta (object, required)
          + status: 200 (number, required)

### Find Specialities [GET /specialities/{id}]

Find speciality by speciality id

+ Parameters
  + id (number, required) - Speciality ID

+ Request (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Specialities-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Speciality not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

# Group Medical Facilities
Medical Facilities is a representation of medical facility on the system.

### List Medical Facilities [GET /medical-facilities]
Returns a list of medical facilities.
+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Medical-Facilities-Response], required)
      + meta (object, required)
          + status: 200 (number, required)

### Find Medical Facilities [GET /medical-facilities/{id}]

Find medical-facility by medical-facility id

+ Parameters
  + id (number, required) - Medical facility ID

+ Request (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Medical-Facilities-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Medical facility not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

# Group Hcps
A Hcps is a representation of a health care person on the system.

### List Hcps [GET /hcps{?limit,offset}]
Returns a list of health care person paginated by the limit and offset.
+ Parameters
  + offset: 0 (number, optional) - The start number of requested records
  + limit: 10 (number, optional) - Number of requested records

+ Request Success (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Hcps-Response], required)
      + meta (object, required)
          + status: 200 (number, required)
          + offset: 0 (number, required)
          + limit: 10 (number, required)

### Find Hcp [GET /hcps/{id}]

Find hcp by hcp id

+ Parameters
  + id (number, required) - Product ID

+ Request (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Hcps-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Hcps not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

# Group Hcfs
A Hcfs is a representation of a health care facility on the system.

### List Hcfs [GET /hcfs{?limit,offset}]
Returns a list of health care facility paginated by the limit and offset.
+ Parameters
  + offset: 0 (number, optional) - The start number of requested records
  + limit: 10 (number, optional) - Number of requested records

+ Request Success (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Hcfs-Response], required)
      + meta (object, required)
          + status: 200 (number, required)
          + offset: 0 (number, required)
          + limit: 10 (number, required)

### Find Hcf [GET /hcfs/{id}]

Find hcf by hcf id

+ Parameters
  + id (number, required) - Product ID

+ Request (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Hcfs-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Hcfs not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

# Group Schedules
A Schedules is a representation of a health care schedule on the system.

### List Schedules [GET /schedules{?limit,offset,hcf_ids,hcp_ids}]
Returns a list of schedules paginated by the limit and offset and can be filtered by hcf and hcp ids.
+ Parameters
  + offset: 0 (number, optional) - The start number of requested records
  + limit: 10 (number, optional) - Number of requested records
  + hcf_ids: `1, 2, 3`, (string, optional) - Use comma if there are more than 1 hcfs.
  + hcp_ids: `1, 2, 3`, (string, optional) - Use comma if there are more than 1 hcps.

+ Request Success (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Schedules-Response], required)
      + meta (object, required)
          + status: 200 (number, required)
          + offset: 0 (number, required)
          + limit: 10 (number, required)

### Find Schedules [GET /schedules/{id}]

Find schedule by schedule id

+ Parameters
  + id (number, required) - Product ID

+ Request (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Schedules-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Hcfs not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

### List Schedules Dates [GET /schedules/date{?hcp_ids,hcf_ids,start_date,end_date}]
Returns a list of schedules date filtered by hcf and hcp ids, start_date, end_date
+ Parameters
  + start_date: `2020-10-10` (string, optional) - The start date of requested records
  + end_date: `2020-10-20` (string, optional) - The end date of requested records
  + hcf_ids: `1,2` (string, optional) - Use comma if there are more than 1 hcfs
  + hcp_ids: `1,2,3` (string, optional) - Use comma if there are more than 1 hcps

+ Request Success (application/json)

+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Schedules-Dates-Response], required)
      + meta (object, required)
          + status: 200 (number, required)
          + offset: 0 (number, required)
          + limit: 10 (number, required)

# Group Consultations
A Consultations is a representation of a health care consultaions on the system.

### List Consultations [GET /consultations{?limit,offset,schedule_ids}]
Returns a list of schedules paginated by the limit and offset and can be filtered by schedules ids.
+ Parameters
    + offset: 0 (number, optional) - The start number of requested records
    + limit: 10 (number, optional) - Number of requested records
    + schedule_ids: `1,2,3`, (string, optional) - Use comma if there are more than 1 schedules.

+ Request Success (application/json)
  + Headers
      access-token: `Ucdf5zO3F1fq3f19vpFxUg`
      client: `Y7ms0Hmebg0p4iNMiF8yng`
      uid: `test2@gmail.com`

+ Response 200 (application/json)
  + Attributes (object)
      + data (array[SehatQ-Consultations-Response], required)
      + meta (object, required)
          + status: 200 (number, required)
          + offset: 0 (number, required)
          + limit: 10 (number, required)

+ Request 401 (application/json)

+ Response 401 (application/json)
  + Attributes (object)
      + errors (array[string], required)
          + `You need to sign in or sign up before continuing.`

### Find Consultations [GET /consultations/{id}]

Find consultation by consultation id

+ Parameters
  + id (number, required) - Product ID

+ Request (application/json)
  + Headers
      access-token: `Ucdf5zO3F1fq3f19vpFxUg`
      client: `Y7ms0Hmebg0p4iNMiF8yng`
      uid: `test2@gmail.com`

+ Response 200 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Consultations-Response
      + meta (object, required)
          + status: 200 (number, required)

+ Response 404 (application/json)
  + Attributes (object)
      + errors : `Consultation not found` (string, required)
      + meta (object, required)
          + status: 404 (number, required)

+ Request 401 (application/json)
  + Headers

+ Response 401 (application/json)
  + Attributes (object)
      + errors (array[string], required)
          + `You need to sign in or sign up before continuing.`

### Create Consultations [POST /consultations]

Create consulations

+ Request (application/json)
  + Headers
      access-token: `Ucdf5zO3F1fq3f19vpFxUg`
      client: `Y7ms0Hmebg0p4iNMiF8yng`
      uid: `test2@gmail.com`

  + Attributes (object)
      + schedule_id: 1 (number, required)
      + date: 1 (string, required)

+ Response 201 (application/json)
  + Attributes (object)
      + data (object, required)
          + Include SehatQ-Consultations-Response
      + meta (object, required)
          + status: 201 (number, required)

+ Response 400 (application/json)
  + Attributes (object)
      + errors : `Fully booked` (string, required)
      + meta (object, required)
          + status: 400 (number, required)

+ Request 401 (application/json)
  + Headers
  + Attributes (object)
      + schedule_id: 1 (number, required)
      + date: 1 (string, required)

+ Response 401 (application/json)
  + Attributes (object)
      + errors (array[string], required)
          + `You need to sign in or sign up before continuing.`


# Data Structures
# `SehatQ-Auth-Response` (object)
+ id: 1 (number, required)
+ name: `Rojali Budi Permadi` (string, required)
+ email: `test1212@gmail.com` (string, required)
+ image_url: `/uploads/user/image_path/1/rojali.png` (string, required)
+ provider: `email` (string, required)
+ uid: `test1212@gmail.com` (string, required)

# `SehatQ-Specialities-Response` (object)
+ id: 1 (number, required)
+ name: `Dokter Umum` (string, required)

# `SehatQ-Medical-Facilities-Response` (object)
+ id: 1 (number, required)
+ name: `Ambulans` (string, required)

# `SehatQ-Hcfs-Response` (object)
+ id: 1 (number, required)
+ name: `RSUD Sumedang` (string, required)
+ image_path: `/uploads/hcf/image_path/1/paviliun.png` (string, optional)
+ description: `Rumah sakit milik pemerintah` (string, optional)
+ hcf_type: `rumah_sakit` (string, required)
+ province: `Jawa Barat` (string, required)
+ city: `Sumedang` (string, required)
+ district: `Sumedang Selatan` (string, required)
+ address: `Jln. Prabu Gajah Agung` (string, required)
+ latitude: -6.371997 (number, optional)
+ longitude: 106.829894 (number, optional)
+ medical_facilities (array[SehatQ-Medical-Facilities-Response], required)

# `SehatQ-Hcps-Response` (object)
+ id: 1 (number, required)
+ name: `Dr. Rojali Budi Permadi` (string, required)
+ image_path: `/uploads/hcp/image_path/1/rojali.png` (string, optional)
+ description: `Dokter dengan pengalaman lebih dari 5 tahun` (string, optional)
+ speciality (object, required)
    + Include SehatQ-Specialities-Response
+ hcfs (array[SehatQ-Hcfs-Response], required)

# `SehatQ-Schedules-Response` (object)
+ id: 1 (number, required)
+ day: `sun` (string, required)
+ time_start: `06:00` (string, required)
+ time_end: `09:00` (string, required)
+ hcp (object, required)
    + id: 1 (number, required)
    + name: `Dr. Rojali` (string, required)
+ hcfs (array[SehatQ-Hcfs-Response], required)

# `SehatQ-Schedules-Dates-Response` (object)
+ id: 1 (number, required)
+ day: `sun` (string, required)
+ date: `2020-10-10` (string, required)
+ time_start: `06:00` (string, required)
+ time_end: `09:00` (string, required)
+ hcp (object, required)
    + id: 1 (number, required)
    + name: `Dr. Rojali` (string, required)
+ hcfs (array[SehatQ-Hcfs-Response], required)

# `SehatQ-Consultations-Response` (object)
+ id: 1 (number, required)
+ date: `2020-10-10` (string, required)
+ users (object, required)
    + id: 1 (number, required)
    + name: `Budi` (string, required)
    + name: `rojali@gmail.com` (string, required)
+ schedule (object, required)
    + Include SehatQ-Schedules-Response
