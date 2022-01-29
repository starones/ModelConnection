class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :presence => { :message => "名前を入力してください" }

  # ------メールアドレスに[@と.]を含まないとエラーが起きる------
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
  :presence => { :message => "メールアドレスを入力してください" },
  format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  validates :message, :presence => { :message => "コメントを入力してください" }
end
