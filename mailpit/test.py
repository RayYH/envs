#!/usr/bin/env bash

from email.mime.text import MIMEText
from smtplib import SMTP
import sys

SMTPserver = '127.0.0.1'
sender = 'support@rayyh.dev'
destination = ['rayyh@rayyh.dev']

USERNAME = "test"
PASSWORD = "test"

text_subtype = 'plain'

content = """\
Test message
"""

subject = "Sent from Python"

msg = MIMEText(content, text_subtype)
msg['Subject'] = subject
msg['From'] = sender  # some SMTP servers will do this automatically, not all

conn = SMTP(SMTPserver, port=1025)
conn.set_debuglevel(False)
conn.login(USERNAME, PASSWORD)
try:
    conn.sendmail(sender, destination, msg.as_string())
finally:
    conn.quit()
