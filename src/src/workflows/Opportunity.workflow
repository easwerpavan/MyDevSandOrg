<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FINAL_APPROVE</fullName>
        <field>APPROVAL_ORDER_STATUD__c</field>
        <literalValue>APPROVED</literalValue>
        <name>FINAL APPROVE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINAL_REJECTION</fullName>
        <field>APPROVAL_ORDER_STATUD__c</field>
        <literalValue>REJECTED</literalValue>
        <name>FINAL REJECTION</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INITIAL_SUBMISSION</fullName>
        <field>APPROVAL_ORDER_STATUD__c</field>
        <literalValue>SUBMITED</literalValue>
        <name>INITIAL SUBMISSION</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_ORDER</fullName>
        <field>RecordTypeId</field>
        <lookupValue>collecting</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN ORDER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_ORDER_TO_CLOSE_ORDERS</fullName>
        <field>RecordTypeId</field>
        <lookupValue>payment</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN ORDER TO CLOSE ORDERS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_ORDER_WORKFLOW</fullName>
        <field>RecordTypeId</field>
        <lookupValue>collecting</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN ORDER WORKFLOW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_TO_SALES</fullName>
        <field>RecordTypeId</field>
        <lookupValue>collecting</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN TO SALES ORDER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_TO_SALES_ORDER</fullName>
        <field>RecordTypeId</field>
        <lookupValue>collecting</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN TO SALES ORDER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPEN_TO_SALES_ORDER_FILED</fullName>
        <field>RecordTypeId</field>
        <lookupValue>collecting</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>OPEN TO SALES ORDER FILED</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OPPORTUNITY_INFO</fullName>
        <field>Name</field>
        <formula>Name  &amp; &quot;-&quot;&amp; Account.Name  &amp; &quot;-&quot;&amp;TEXT( CreatedDate )</formula>
        <name>OPPORTUNITY INFO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RECALLED</fullName>
        <field>APPROVAL_ORDER_STATUD__c</field>
        <literalValue>RECALLED</literalValue>
        <name>RECALLED</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RECENT_RECORD_NAME</fullName>
        <field>NAME_OF_RECORD__c</field>
        <formula>Name</formula>
        <name>RECENT RECORD NAME</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SALES_TO_CLOSED</fullName>
        <field>RecordTypeId</field>
        <lookupValue>payment</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>SALES TO CLOSED ORDER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SALES_TO_CLOSED_ORDER</fullName>
        <field>RecordTypeId</field>
        <lookupValue>payment</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>SALES TO CLOSED ORDER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
