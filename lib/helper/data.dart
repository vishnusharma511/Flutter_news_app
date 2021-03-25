import '../models/categor_model.dart';

List<CategorModel> getCategor(){
  List<CategorModel> categor =new List<CategorModel>();
  CategorModel categorModel =new CategorModel();

  //1
  categorModel.categorName ="Business";
  categorModel.imageUrl ="https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  categor.add(categorModel);
  categorModel =new CategorModel();

  //2
  categorModel = new CategorModel();
  categorModel.categorName = "Entertainment";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categor.add(categorModel);

  //3
  categorModel = new CategorModel();
  categorModel.categorName = "General";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categor.add(categorModel);

  //4
  categorModel = new CategorModel();
  categorModel.categorName = "Health";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categor.add(categorModel);

  //5
  categorModel = new CategorModel();
  categorModel.categorName = "Science";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categor.add(categorModel);

  //6
  categorModel = new CategorModel();
  categorModel.categorName = "Sports";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categor.add(categorModel);

  //7
  categorModel = new CategorModel();
  categorModel.categorName = "Technology";
  categorModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categor.add(categorModel);
  
  return categor;
}