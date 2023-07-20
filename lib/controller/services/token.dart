import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRequestInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    print("token $token");
    // String token =
    //     "eyJhbGciOiJBMTI4S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwidHlwIjoiSldUIn0.rmGKjUT7I1FinXwOnL387HhrQRfn7IwGEdsTAkpiGpAEwtLJTyaHmA.dE_Wq89mBICPSuOXsurdeg.A21Tam6a7Fhg_sWV_C--kpPp2SGJlSjv2JbQ1n-dRXIYGTqnC1EilwHo27cRXG3Lq5-ea0OnOIzGVNx8X-c5coRDJaDz8LfX4XtwulPyDqhRm2Uc4IOzPv9iK5ddPf3SJlW6pXiR0WUj7VY_Lg7GfNmmSgFQRzzPrcvuxvoqt_D15jEpYTyqi_XPAT8xBGXWnKO2SBnDvroeKe8C-DTMSWfd_kw_tNZQJJBYbGt0jO9wO0W3izEhit3WguL6xNGOV6z7gw5pIAW7rSmlm5eYuc28Jf0HWQJqCkILHWhLdG5OxRGoCzQlexk5gTlqC6IytAnOjrlQ489-zS5BM7Zsuoc5r3bDqT2XNuS4HEaxQZzOdhHtJMVzI2OykqGgpVHh-rZhbw2duGSboPFzy0DAV14gSWDUGt-HMZedoU7Qpyn92k-7LWerao9Fun187QIWO4e3npzu9vMPQBe21ZG97i--CA5KLHimgXyzZ4ZT9X6aqPNqi4LWaHxEPeZUrWyYVRw40V4fnjwnwiKfywao7kvUMBQayFkYcJrdm2tjyPTrBrAzIZI3bViJyHIG1izXfQNTykRjVFcahctjRC0ioz4Ogbs1ygp1XS2ABYAyCF_7tpg4aRAgnj70qNIiQDn_bkJLgsHiUR7iAjXb3JtM5tfOOYT8YcmKFXCo71baIg9lLQKHLb27EGxRZ_PzIrrcGYpe4f1cIW2XoNz6K4QkDCCgX0pjmiVaBaq2mzgHcsDAm_Hi90L1LtTtvkyOvb9F.DcNvT9Mkf68iQJHnFYEv7A";
    return applyHeader(request, 'Authorization', 'Bearer $token');
  }
}
