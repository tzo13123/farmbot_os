if Code.ensure_loaded?(Mix.Tasks.Firmware.Push) do

  defmodule Mix.Tasks.Farmbot.Upload do
    @moduledoc false
    use Mix.Task
    alias Mix.Tasks.Firmware.Push
    @shortdoc "Uploads a file to a url"
    def run([ipaddr]) do
      otp_app = Mix.Project.config[:app]
      target = Mix.Project.config[:target]
      fw_file = Path.join(["images", "#{Mix.env()}", "#{target}", "#{otp_app}.fw"])
      unless File.exists?(fw_file) do
         raise "Could not find Firmware!"
      end
      Push.run([ipaddr, "--firmware", "#{fw_file}", "--reboot", "true"])
    end
  end

else

  defmodule Mix.Tasks.Farmbot.Upload do
    @moduledoc false
    use Mix.Task
    @shortdoc "Uploads a file to a url"
    def run(_) do
      Mix.raise """
      UH
      """
    end
  end

end
