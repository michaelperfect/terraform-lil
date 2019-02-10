//variable "newvariable"{
//  type="string"
//  default="this is value"
//}
//variable "map"{
//  type="map"
//  default={subnet1="subnet1"}
//}
//variable "listtype"{
//  type="list"
//  default=["item1","item2"]
//}



variable aws_ip_cidr_range{
  default="10.0.1.0/24"
  type = "string"
  description = "IP CIDR Range for AWS VPC"
}

variable subnet_names {
  type="map"
  default={
    subnet1="subnetone"
    subnet2="subnetwo"
    subnet3="subnethree"
  }
}

//output variables - displayed at the end of terraform execution
output "first_output"{
  value = "this is the value through execution."
}

output "aws_cidr_subnet1" {
  value = "${aws_subnet.subnet1.cidr_block}"
}

//input variable
//terraform apply
//variable "new_value" {
//
//}

//input variable
//terraform apply -var 'newmap={subnet1="sally", subnet2="frank"}'
//variable newmap {
//  type = "map"
//}