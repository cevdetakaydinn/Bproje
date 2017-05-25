
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  attr_accessor :score
  def initialize(curriculum,day,hr)
    rnd=Random.new
    @genes=Array.new(day){Array.new(hr)}
    curriculum.each do |cur|
      hour= Departmentlesson.find(cur[0].departmentlesson_id).hour_amount
      curCurrent=cur[0].id
      i=0
      while i < hour
        rday=rnd.rand(day)
        rhour=rnd.rand(hr)
        if @genes[rday][rhour].blank?
          @genes[rday][rhour]=curCurrent
          i=i+1
        end
      end
    end
    # @genes=Matrix.build(Day.all.size, Lessonhour.all.size) {|row, col| curriculum[rand((Lessonhour.all.size*Day.all.size)-curriculum.size)] }
  end
  def getScore
    @score
  end
  def getGen
    @genes
  end
  def crossover(partner)
    #bu ve parterin genlerinin yarılarını al birleştir.Ve 2 tane çocuk geri döndür.
  end

  def mutation(mRate)
    #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
      #genes deki bütün id ler bi listeye koy .rand() ile rasgele birini seç ve on ait  dersleri başka yere koy
      if rand<mRate
        day=Day.all.size
        hours=Lessonhour.all.size
        ranD1=rand(day)
        ranL1=rand(hours)
        ders=@genes[ranD1][ranL1]
        if !(ders.nil?)
          binding.pry
          ranD2=rand(day)
          ranL2=rand(hours)
          @genes[ranD1][ranL1]=@genes[ranD2][ranL2]
          @genes[ranD2][ranL2]=ders
        else
          mutation(mRate)
        end
      end
  end

  def fitness
    @score=0
    self.getGen.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if !(modul.blank?)
          #Aynı saatteki bütün dersleri bul
          ws = Weeklyschedule.where(day_id:row , lessonhours_id:col)
          cur=Curriculum.find(modul)
          curgrade=cur.departmentlesson.grade

          ws.each do |wc|
            #hoca çakışması kontrol
            wsc=wc.curriculum
            if cur.admin.id != wsc.admin.id
              @score = @score + 1
              # elsif #Sınıf çakışması yoksa ve sınıf kontenjanı yetiorsa
              #    @score = @score + 1
            #Aynı sınıfın başka dersi varmı
            elsif cur.departmentlesson.grade != wsc.departmentlesson.grade
                @score = @score + 1
            end
          end
        end
      end
    end
    return @score
  end
end
