class Articles < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true

  def self.create_new(params)
    article = Articles.create(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author],
      :publish => params[:publish].to_s == "on" ? true : false
      )
    save_ok = true
    begin
      article.save!
    rescue ActiveRecord::RecordInvalid => e
      save_ok = false
    end
    save_ok
  end

  def self.update_existing(params)
    article = Articles.find(params[:id])
    article.update(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author],
      :publish => params[:publish].to_s == "on" ? true : false
      )
    save_ok = true
    begin
      article.save!
    rescue ActiveRecord::RecordInvalid => e
      save_ok = false
    end
    save_ok
    
  end
end
