resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgFNu57lUI2qx6CuvacTtW4xgdeGwJxLrz6tdHUtU8B me@steveparson.ca"
}
