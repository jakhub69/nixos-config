{ ... }:

{
  users.users.jj = {
    isNormalUser = true;
    description = "jj";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "render"
      "input"
      "storage"
    ];
  };
}
