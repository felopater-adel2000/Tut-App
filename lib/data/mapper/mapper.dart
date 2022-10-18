import 'package:app/app/constants.dart';
import 'package:app/app/extensions.dart';
import 'package:app/data/response/responses.dart';
import 'package:app/domain/model/models.dart';


// this files contains Extension functions to convert "Response Classes" --> to --> "Domain Classes"
extension CustomerResponseMapper on CustomerResponse?
{
  Customer toDomain()
  {
    return Customer(this?.id.orEmpty() ?? Constants.EMPTY, this?.name.orEmpty() ?? Constants.EMPTY, this?.numOfNotification.orZero() ?? Constants.ZERO);
  }
}

extension ContactResponseMapper on ContactsResponse?
{
  Contacts toDomain()
  {
    return Contacts(this?.phone.orEmpty() ?? Constants.EMPTY, this?.email.orEmpty() ?? Constants.EMPTY, this?.link.orEmpty() ?? Constants.EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?
{
  Authentication toDomain()
  {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}