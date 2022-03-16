declare module "@salesforce/apex/teammemberclass.results" {
  export default function results(param: {member: any}): Promise<any>;
}
declare module "@salesforce/apex/teammemberclass.getTeammembers" {
  export default function getTeammembers(): Promise<any>;
}
declare module "@salesforce/apex/teammemberclass.deleteteammember" {
  export default function deleteteammember(param: {teamrecordId: any}): Promise<any>;
}
