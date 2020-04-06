defmodule Cards do
  @moduledoc """
    Provides method for creating and handling a deck of cards
  """

  @doc """
     Create a deck of Cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines if a deck contains a particular card.

    ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck,"Three of Clubs")
        true
        iex> Cards.contains?(deck,"Three of Club")
        false

  """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  @doc """
    Divides a deck into a hand of cards.
    
    ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, _deck} = Cards.deal(deck,1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck,hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename)  do
    case File.read(filename) do
       {:ok, file_data} -> :erlang.binary_to_term(file_data)
       _ -> "Could not find file"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)
    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
