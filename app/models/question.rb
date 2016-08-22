class Question < ApplicationRecord

  # this associates the question with answer in a one-to-many fashion
  # this will give us handy methods to easily created associated answers and
  # fetch associated answers as well. Note that it should be pluralized for
  # one to many association.
  # You should also add a dependent option. The value can be:
  # destroy: will deleted associated answers before deleting a question
  # nullify: will make question_id 'null' for associated answers before deleting
  # answers is referring to multiple versions of the model answer
  has_many :answers, dependent: :destroy

  # validates(:title, {presence: true}) - more verbose way
  # validates for title

  validates :title, presence: true, uniqueness: {message: "must be unique!"}

  # validate the length
  validates :body, presence: true, length: {minimum: 5}

  # validates :title, uniqueness: {scope: :body}


  # This validates that the title/body combination is unique which means that
  # title doesn't have to be unique by itself, body doesn't have to be unique
  # by itself but the combination of the two must be unique.
  # validates :body, uniqueness: {scope: :title}


  # Make sure you are getting a proper email address
  # VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :email, format: VALID_EMAIL_REGEX

  #custom validation method
  # this defines a custom validation. It takes a frist argument which in this
  # case is a private method
  # !!!! word:  validate
  validate :no_monkey

  after_initialize :set_defaults

  before_validation :cap_title

  belongs_to :user 

  def titleized_title
    title.titleize
  end

  def self.recent_ten
    order(created_at: :desc).limit(10)

    #alternate
    #last(10)
  end

  #scope :recent_ten, lambda { order(created_at: :desc).limit(10) }

  def self.search(keyword)
    tables = where(["title ILIKE ? OR body ILIKE ?", "%#{keyword}%", "%#{keyword}%"])
    tables.order(title: :asc)
  end

  private

  def no_monkey
      if title && title.downcase.include?("monkey")
        errors.add(:title, "No monkey please!")
      end
  end

  # want to sent something, use self
  # want to show something, no self

  def set_defaults
    self.view_count ||= 0
  end

  def cap_title
    self.title.capitalize! if title
  end

end
