bucket_name = "dev-proj-1-remote-state-bucket"
name        = "environment"
environment = "dev-1"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["eu-central-1a", "eu-central-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkHLGi3UoxYqDOK6KNwlAcLjzF8gu6SV1/7tHR4S/5tKRuRL5BqgRKobvImu7mLUIgaau/dLS6NCOCOV3Os6slAndcpXD+3w4Yl5ebCk3e7MeFUwxOUNqCj8sUv/Vpxxfn7Pegd7DStpjqA0XujJb8as2dLO4sqmd2CS4Ru8HhuPwEtKYQuRd36p/UODBPU57n+bP4J6HkZ3trEF2LWGQPMcr1RfC2ObLTpOpB1VPooItRSAbyGaMe0Bj9wiJ7XHRjRRR/hJec0ygF5pT6boPn3TU2wpawh75iOjT4uQ9ukgZQwyVg53ymwJDnblidEgFOcTOCdXfy6Uqi+CnXpkJl ayush007@ayush007"
ec2_ami_id     = "ami-06dd92ecc74fdfb36"

ec2_user_data_install_python_app = ""

domain_name = "ayushsharma.co.in"