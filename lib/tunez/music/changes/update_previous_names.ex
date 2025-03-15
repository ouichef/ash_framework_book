defmodule Tunez.Music.Changes.UpdatePreviousNames do
  use Ash.Resource.Change
  alias Ash.Changeset

  def change(changeset, _opts, _context) do
    Changeset.before_action(changeset, fn changeset ->
      new_name = Changeset.get_attribute(changeset, :name)
      previous_name = Changeset.get_data(changeset, :name)
      previous_names = Changeset.get_data(changeset, :previous_names)

      names =
        [previous_name | previous_names]
        |> Enum.uniq()
        |> Enum.reject(fn name -> name == new_name end)

      Changeset.change_attribute(changeset, :previous_names, names)
    end)
  end
end
