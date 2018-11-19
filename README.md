# Academic-Probation-at-ISS
Capstone project for MSIS at University of Arizona

Academic Probation Report and Prediction for International Students Services (ISS)

MSIS Capstone Project
Aiman Mustaqalli Sande, Jacey(Xi) Yang Fall 2018
Supervised by: Prof. Hong Cui

Sponsored by: The University of Arizona International Student Services 

The main aim of the project is to deliver a system for the International Students Services (ISS) of University of Arizona to create a central data warehouse and then generate reports and predict the possibility of an International student to go on academic probation. A student is said to be on an academic probation when the GPA of the student is below 2.0 for Undergrad and 3.0 for Grad students for the respective year. Academic probation is important because it is used by United States Immigration services to maintain active F1 student Visa status.

Currently the ISS office has a large amount of data available but not readily accessible for use. In addition, the process of reaching out students’ who are on probation is complex and inefficient, and the process only starts after a student is put on probation. ISS would like to have a system that helps them predict students’ academic performance, so they can start helping students in advance. Our project aims on creating a central data warehouse so as to combine multiple data sources which will clean and structured data. Moreover, we will create Business Intelligence reports and a prediction model using R.

Proposed Method
The first part of the project is to build a structured data warehouse by collecting raw data from multiple sources. Currently ISS has data in multiple spreadsheets and data is not organized. The raw data initially will be processed in staging tables and cleaned for any incorrectness, incompleteness, improperly formatted, or duplicated data.

After the cleaning process, the data will be organized in “snowflake star schema” fashion with dimension and fact tables. Once the data warehouse is built, then the main aim of our project can be achieved by predicting the students who might go on probation in the coming semester so that they can reach out to them before and do their counseling or guide them for further resources. This would prevent the number of students going on probation. We plan to use past data(cleaned) of students to build a model in "R" to predict students who may go on probation. Example, if currently 10 students are going on probation, we expect that with our project ISS can bring down the number to 5.

The final part of the project also aims on providing data reports to the ISS office about the international students using Tableau software.

Diagram: Project Flowchart

Data
The data we are going to use for this project is real life data provided by the International Student Services. The ISS has an enormous amount of data stored in their system, the data goes back as early as year 2012, and it covers a broad range of information, such as students’ demography, academic performance, and survey results. Right now, this valuable information is just sitting in their system and taking up memory spaces, but we will put it to use and make something meaningful out of it.
We will request the data we need from the ISS program director Lara Pfaff, and she then will retrieve the data from their system and clean out all the confidential information. As we progress with our project throughout the semester, we will also be getting fresh data from ISS’s ongoing programs and surveys.

Expected Results/Deliverables
GitHub, automation systems for generating report and performing prediction

Entire Semester - Fall 2018
Proposed Timeline Risks
There are couple of risks that we might encounter during the development of our project. The biggest concern for us is data security. The data we are using are students’ real records, and it contains many confidential information; that information can be leaked due to human mistake and system vulnerability. To minimize the possibility of data leaking, we will use a secured Oracle cloud database to store the data, and only the ISS management team has access besides us. Moreover, the final product will only be used internally at ISS, and it will not connect to any external network.

     
