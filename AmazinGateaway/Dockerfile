﻿FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

## This has an error with default dotnet 8.0 so I use configuration of dotnet 7.0
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["AmazinGateaway.csproj", "."]
RUN dotnet restore "./AmazinGateaway.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "AmazinGateaway.csproj" -c Release -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "AmazinGateaway.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AmazinGateaway.dll"]


## This is the default SDK 8.0 

#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
#USER $APP_UID
#WORKDIR /app
#EXPOSE 8080
#EXPOSE 8081
#
#FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
#ARG BUILD_CONFIGURATION=Release
#WORKDIR /src
#COPY ["AmazinGateaway/AmazinGateaway.csproj", "AmazinGateaway/"]
#RUN dotnet restore "AmazinGateaway/AmazinGateaway.csproj"
#COPY . .
#WORKDIR "/src/AmazinGateaway"
#RUN dotnet build "AmazinGateaway.csproj" -c $BUILD_CONFIGURATION -o /app/build
#
#FROM build AS publish
#ARG BUILD_CONFIGURATION=Release
#RUN dotnet publish "AmazinGateaway.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "AmazinGateaway.dll"]