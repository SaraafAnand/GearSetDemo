//Generated by wsdl2apex

public class AsyncServicesPostcodeanywhereCoUk {
    public class Capture_Interactive_Find_v1_10_Response_elementFuture extends System.WebServiceCalloutFuture {
        public servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_ArrayOfResults getValue() {
            servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_element response = (servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_element)System.WebServiceCallout.endInvoke(this);
            return response.Capture_Interactive_Find_v1_10_Result;
        }
    }
    public class AsyncPostcodeAnywhere_Soap {
        public String endpoint_x = 'http://services.postcodeanywhere.co.uk/Capture/Interactive/Find/v1.10/soapnew.ws';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://services.postcodeanywhere.co.uk/', 'servicesPostcodeanywhereCoUk'};
        public AsyncServicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_elementFuture beginCapture_Interactive_Find_v1_10(System.Continuation continuation,String Key,String Text,Boolean IsMiddleware,String Container,String Origin,String Countries,Integer Limit_x,String Language) {
            servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_element request_x = new servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_element();
            request_x.Key = Key;
            request_x.Text = Text;
            request_x.IsMiddleware = IsMiddleware;
            request_x.Container = Container;
            request_x.Origin = Origin;
            request_x.Countries = Countries;
            request_x.Limit_x = Limit_x;
            request_x.Language = Language;
            return (AsyncServicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncServicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://services.postcodeanywhere.co.uk/Capture_Interactive_Find_v1_10',
              'http://services.postcodeanywhere.co.uk/',
              'Capture_Interactive_Find_v1_10',
              'http://services.postcodeanywhere.co.uk/',
              'Capture_Interactive_Find_v1_10_Response',
              'servicesPostcodeanywhereCoUk.Capture_Interactive_Find_v1_10_Response_element'}
            );
        }
    }
}