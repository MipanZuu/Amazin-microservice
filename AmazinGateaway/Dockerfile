FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

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

#FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
#WORKDIR /src
#COPY ["MyProjectName.csproj", "."] <--------------------- THIS WORKS !!!! 
#RUN dotnet restore "./MyProjectName.csproj"
#COPY . .
#WORKDIR "/src/."
#RUN dotnet build "MyProjectName.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "MyProjectName.csproj" -c Release -o /app/publish /p:UseAppHost=false
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "MyProjectName.dll"]