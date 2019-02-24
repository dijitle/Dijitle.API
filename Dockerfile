FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build

COPY ["src/Dijitle.API/Dijitle.API.csproj", "src/Dijitle.API/"]
COPY ["tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj", "tests/Dijitle.API.Tests/"]

RUN dotnet restore "src/Dijitle.API/Dijitle.API.csproj"
RUN dotnet restore "tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj"

COPY . .
RUN dotnet build "src/Dijitle.API/Dijitle.API.csproj" \
--configuration Release 

RUN dotnet test "tests/Dijitle.API.Tests/Dijitle.API.Tests.csproj" \
--configuration Release 

RUN dotnet publish "src/Dijitle.API/Dijitle.API.csproj" \
--configuration Release \
--no-build \
--no-restore \
--output /app

FROM base AS final
WORKDIR /app
COPY --from=build /app /app
ENTRYPOINT ["dotnet", "Dijitle.API.dll"]