declare module "@salesforce/apex/contacteditrecord.result" {
  export default function result(param: {contact: any}): Promise<any>;
}
declare module "@salesforce/apex/contacteditrecord.getcontactrecord" {
  export default function getcontactrecord(param: {editedrecordid: any}): Promise<any>;
}
declare module "@salesforce/apex/contacteditrecord.getpicklistFieldValue" {
  export default function getpicklistFieldValue(): Promise<any>;
}
