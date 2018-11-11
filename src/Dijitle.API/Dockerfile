FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 49687
EXPOSE 44332
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
COPY ["src/Dijitle.API/Dijitle.API.csproj", "src/Dijitle.API/"]
COPY ["tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj", "tests/Dijitle.API.Tests/"]
RUN dotnet restore "src/Dijitle.API/Dijitle.API.csproj"
RUN dotnet restore "tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj"
COPY . .
RUN dotnet build "src/Dijitle.API/Dijitle.API.csproj" -c Release -o /app
RUN dotnet test "tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj" -c Release -o /app


FROM build AS publish
RUN dotnet publish "src/Dijitle.API/Dijitle.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Dijitle.API.dll"]