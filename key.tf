resource "aws_key_pair" "user02-key" {
  key_name = "${var.PATH_TO_PRIVATE_KEY}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
  lifecycle {
    ignore_changes = ["public_key"]
  }
}
