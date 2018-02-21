#!/bin/bash
service nginx start
dotnet /app/out/app.dll
