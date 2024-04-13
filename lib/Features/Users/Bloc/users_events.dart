abstract class UserEvents{}

class AddUser extends UserEvents{
  final String name;
  AddUser(this.name);
}
class ClearUsers extends UserEvents{}
class RemoveUser extends UserEvents{
  final int index;
  RemoveUser(this.index);
}