public class DataTreeWrapper{
		public String listIdField{get;set;}
		public String nameField{get;set;}
		public String idField{get;set;}
		public String firstNameField{get;set;}
		public Integer fixedColumn{get;set;}
		public String lastNameField{get;set;}
		public list<list<Integer>> aLengthMenu{get;set;}
		public String emailField{get;set;}
		public list<fieldGroup> fieldGroup{get;set;}
		public String defaultOrderBy{get;set;}
		public Boolean columnSelection{get;set;}
		public Integer defaultSortCol{get;set;}
		public list<String> selectAction{get;set;}
		public String defaultSortOrder{get;set;}
	public class fieldGroup{
		public Boolean csv{get;set;}
		public String label{get;set;}
		public String apiName{get;set;}
		public String type{get;set;}
		public String id{get;set;}
        public String filterFieldApiName {get;set;}
        public Boolean genealogyIcons {get;set;}
        public Boolean linkToAccount {get;set;}
        public Boolean shouldHide {get;set;}
        public Boolean searchable {get;set;}
        public Boolean autoFormat {set;get;}
        public Boolean sortable {get;set;}
        public List<selectValues> selectValues {set;get;}
	}
    public class selectValues{
        public String name {get;set;}
        public List<String> values {get;set;}
    } 
}