class WindDirectionConverter {
  String convert(String windDirectionCompass) {
    String result = "";
    switch (windDirectionCompass) {
      case "N":
        result = "North";
        break;
      case "NNE":
        result = "North North East";
        break;
      case "NE":
        result = "North East";
        break;
      case "ENE":
        result = "East North East";
        break;
      case "E":
        result = "East";
        break;
      case "ESE":
        result = "East South East";
        break;
      case "SE":
        result = "South East";
        break;
      case "SSE":
        result = "South South East";
        break;
      case "S":
        result = "South";
        break;
      case "SSW":
        result = "South South West";
        break;
      case "SW":
        result = "South West";
        break;
      case "WSW":
        result = "West South West";
        break;
      case "W":
        result = "West";
        break;
      case "WNW":
        result = "West North West";
        break;
      case "NW":
        result = "North West";
        break;
      case "NNW":
        result = "North North West";
        break;
    }
    return result;
  }
}
