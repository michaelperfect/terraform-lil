//resource "google_compute_network" "our_development_network" {
//  name ="devnetwork"
//  auto_create_subnetworks=true // change to false then the whole network is to be removed
//}

resource "aws_vpc" "environment-example-two"{
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name="terraform-aws-vpc-example-two"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block="${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}" //will be located in the vpc already created
  vpc_id="${aws_vpc.environment-example-two.id}" //if there is only one then use this id
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "subnet2" {
  cidr_block="${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}" //will be located in the vpc already created
  vpc_id="${aws_vpc.environment-example-two.id}" //if there is only one then use this id
  availability_zone = "eu-west-1b"
}

//cidrsubnet(iprange, newbits, netnum)
//where
//
//iprange is the CIDR block of your virtual network,
//newbits is the new mask for the subnet within the virtual network, and
//netnum is the zero-based index of the subnet when the network is masked with the newbit.


resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.environment-example-two.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-example-two.cidr_block}"]

    from_port = 80
    to_port = 80
    protocol ="tcp"
  }
}