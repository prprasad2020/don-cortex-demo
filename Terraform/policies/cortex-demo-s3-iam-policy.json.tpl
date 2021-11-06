{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CortexS3BucketAccess",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "${cortex_bucket_arn}",
                "${cortex_bucket_arn}/*"
	    ]
        }
    ]
}
