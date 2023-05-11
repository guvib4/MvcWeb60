FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MvcWeb60/MvcWeb60.csproj", "MvcWeb60/"]
RUN dotnet restore "MvcWeb60/MvcWeb60.csproj"
COPY . .
WORKDIR "/src/MvcWeb60"
RUN dotnet build "MvcWeb60.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MvcWeb60.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MvcWeb60.dll"]