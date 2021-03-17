 INSERT INTO [dbo].[Configuration] (Category,[Name],[Value],[Description]) 
  values('AppointmentConfig','DurationOfAppointment','15,30,45','Shown in drop down of Appointment Config'),
  ('AppointmentConfig','AppointmentNoticePeriod','30,60,90','Shown in drop down for appointment notice period'),
  ('AppointmentConfig','AppointmentNotificationAlert','15,30,45','Shown in drop down of notification alert'),
  ('AppointmentConfig','AppointmentBuffer','15,30,45','Shown in appointment buffer drop down'),
  ('UserDropDownConfig','Systems Administrator','1,2,3,4','System Admin Drop Down'),
  ('UserDropDownConfig','Networks Administrator','2,3,4','Network Admin Drop Down'),
  ('UserDropDownConfig','Clinic Admin','4','Clinical Admin Drop Down')
  GO
