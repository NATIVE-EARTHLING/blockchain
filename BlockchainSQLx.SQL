Azure Virtual Machine serverlessSQL SQL, databases, datatables, characteristics, variable characteristics, cosmosDB, DevOps, 

varChar "x" = Admins
A common blockchain pattern is IoT-enabled monitoring of an asset as it moves along a multi-party supply chain. A great example of this pattern is the refrigerated transportation of perishable goods like food or pharmaceuticals where certain compliance rules must be met throughout the duration of the transportation process. In this scenario, an initiating counterparty (such as a retailer) specifies contractual conditions, such as a required humidity and temperature range, that the custodians on the supply chain must adhere to. At any point, if the device takes a temperature or humidity measurement that is out of range, the smart contract state will be updated to indicate that it's out of compliance, recording a transaction on the blockchain and triggering remediating events downstream.
FLOW

1 IoT devices communicate with IoT Hub. IoT Hub as a route configured that will send specific messages to a Service Bus associated with that route. The message is still in the native format for the device and needs to be translated to the format used by Azure Blockchain Workbench. An Azure Logic App performs that transformation. It is triggered when a new message is added to the Service Bus associated with the IoT hub, it then transforms the message and delivers it to the Service Bus used to deliver messages to Azure Blockchain workbench. The first service bus effectively serves as an "Outbox" for IoT Hub and the second one serves as an "Inbox" for Azure Blockchain Workbench.
2 DLT Consumer fetches the data from the message broker (Service Bus) and sends data to Transaction Builder - Signer.
3 Transaction Builder builds and signs the transaction.
4 The signed transaction gets routed to the Blockchain (Private Ethereum Consortium Network).
5 DLT Watcher gets confirmation of the transaction commitment to the Blockchain and sends the confirmation to the message broker (Service Bus).
6 DB consumers send confirmed blockchain transactions to off-chain databases (Azure SQL Database).
7 Information analyzed and visualized using tools such as Power BI by connecting to off-chain database (Azure SQL Database).
8 Events from the ledger are delivered to Event Grid and Service Bus for use by downstream consumers. Examples of "downstream consumers" include logic apps, functions or other code that is designed to take action on the events. For example, an Azure Function could receive an event and then place that in a datastore such as SQL Server.
