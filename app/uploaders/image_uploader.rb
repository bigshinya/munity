# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base  
  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  # S3 strage
  storage :fog

  # Local strage
  # storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    #{}"/images/fallback/" + [version_name, "default.png"].compact.join('_')
    'default_avatar.png' #rails will look at 'app/assets/images/default_avatar.png'
  end

  # 画像の上限を700pxにする
  process :resize_to_limit => [700, 700]

  # サムネイルを生成する設定
  version :large do
    process :resize_to_limit => [300, 300]
  end

  version :thumb do
    process :resize_to_limit => [150, 150]
  end

  version :mini do
    process :resize_to_limit => [50, 50]
  end

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

 # 日付(20131001.jpgみたいなファイル名)で保存する
 # def filename
 #   time = Time.now
 #   name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
 #   name.downcase
 # end

end
