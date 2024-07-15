abstract class DataService<T> {
  Stream<List<T>> getData();
  Future<void> addData(Map<String, dynamic> data);
  Future<void> updateData(String itemId, Map<String, dynamic> data);
  Future<void> deleteData(String itemId);
  Future<T> getItemById(String itemId);
}
