#!/bin/bash

now=$(date)

raspistill -n -o /home/pi/Pictures/"$now".jpg
cp /home/pi/Pictures/"$now".jpg /var/www/porch/image.jpg

image="http://adventuresoflizandscott.com/porch/image.jpg"

top="<html><head><meta http-equiv='X-UA-Compatible' content='IE=edge'  charset='utf-8'/><link rel='stylesheet' type='text/css' href='style.css' /><title>View from the porch</title></head><body>"
navBar="<nav id='primary_nav_wrap'><ul id='wrapper'><li class='current-menu-item'><a href='index.html'>Home</a></li><li><a href='#'>Raspberry Pi Projects</a><ul><li><a href='#'>Home Automation</a></li><li><a href='#'>Photobooth</a></li><li><a href='#'>Porch Camera</a></li><li><a href='content.html'>Crawler</a></li></ul></li><li><a href='#'>Adventures</a><ul><li><a href='wedding.html'>Wedding</a></li><li class='dir'><a href='indy.html'>Indy</a></li><li class='dir'><a href='finn.html'>Finn</a></li></ul></li><li><a href='#'>Camping</a><ul><li><a href='#'>Uwharries</a></li><li><a href='#'>Stone Mountain</a></li><li><a href='#'>Colorado</a></li></ul></li></ul></nav>"
bottom="<p class='centered'><img src='porch/image.jpg' class='image'/></p><p class='centered'>Taken at $now</p></body></html>"
html=$top$navBar$imageId$bottom


rm -rf /var/www/index.html
echo $html >> /var/www/index.html

