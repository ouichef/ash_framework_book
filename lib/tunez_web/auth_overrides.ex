defmodule TunezWeb.AuthOverrides do
  use AshAuthentication.Phoenix.Overrides
  alias AshAuthentication.Phoenix.Components
  # configure your UI overrides here

  # First argument to `override` is the component name you are overriding.
  # The body contains any number of configurations you wish to override
  # Below are some examples

  # For a complete reference, see https://hexdocs.pm/ash_authentication_phoenix/ui-overrides.html

  override Components.Banner do
    set :image_url, nil
    set :dark_image_url, nil
    set :text_class, "text-8xl text-accent-400"
    set :text, "♫"
  end

  override Components.Password do
    set :toggler_class, "flex-none text-primary-600 px-2 first:pl-0 last:pr-0"
  end

  override Components.Password.Input do
    set :field_class, "mt-4"
    set :label_class, "block text-sm font-medium leading-6 text-zinc-800"
    set :input_class, TunezWeb.CoreComponents.form_input_styles()

    set :input_class_with_error, [
      TunezWeb.CoreComponents.form_input_styles(),
      "!border-error-400 focus:border-error-600 focus:ring-error-100"
    ]

    set :submit_class, [
      "phx-submit-loading:opacity-75 my-4 py-3 px-5 text-sm",
      "bg-primary-600 hover:bg-primary-700 text-white",
      "rounded-lg font-medium leading-none"
    ]

    set :error_ul, "mt-2 flex gap-2 text-sm leading-6 text-error-600"
  end

  override Components.MagicLink do
    set :request_flash_text, "Check your email for a sign-in link!"
  end
end
