class CategoryQueries {
  factory CategoryQueries() {
    return _instance;
  }
  const CategoryQueries._();

  static const CategoryQueries _instance = CategoryQueries._();

  Map<String, dynamic> getAllCategories() {
    return {
      'query': '''
      { 
       categories{
	      id
	    	name
		   image
       
              }
                   }
       '''
    };
  }
}
