FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 49687
EXPOSE 44332

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Dijitle.API/Dijitle.API.csproj", "Dijitle.API/"]
RUN dotnet restore "Dijitle.API/Dijitle.API.csproj"
COPY . .
WORKDIR "/src/Dijitle.API"
RUN dotnet build "Dijitle.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Dijitle.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Dijitle.API.dll"]