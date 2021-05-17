abstract class DbInternal{
  void create(String id, String archive);
  Future<String> read(String id);
  void update(String id);
  void delete(String id);
}