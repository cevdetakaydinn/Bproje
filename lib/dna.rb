
class Dna
  attr_accessor :score, :genes
  def initialize(curriculum,day,hr)
    @@day= day
    @@hour= hr
    @@curriculum=curriculum
    rnd = Random.new
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
    # @genes=Matrix.build(@@day, @@hour) {|row, col| curriculum[rand((@@hour*@@day)-curriculum.size)] }
  end
  def getScore
    @score
  end
  def getGen
    @genes
  end
  def crossover(partner)
    #bu ve parterin genlerinin yarılarını al birleştir.Ve 2 tane çocuk geri döndür.
    child1=Dna.new(@@curriculum,@@day,@@hour)
    child2=Dna.new(@@curriculum,@@day,@@hour)
    birey = @genes
    birey2 = partner.genes
    day=@@day
    birey_P1 = birey[0, day/2]
    birey_P2 = birey[day/2..-1]
    birey2_P1 = birey2[0, day/2]
    birey2_P2 = birey2[day/2..-1]
    child1.genes=birey_P1+birey2_P2
    child2.genes=birey2_P1+birey_P2
    return child1,child2
  end

  def mutation(mRate)
    #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
    #genes deki bütün id ler bi listeye koy .rand() ile rasgele birini seç ve on ait  dersleri başka yere koy
    if rand<mRate
      day=Day.all.size
      hours=@@hour
      ranD1=rand(day)
      ranL1=rand(hours)
      ders=@genes[ranD1][ranL1]
      if !(ders.nil?)
        ranD2=rand(day)
        ranL2=rand(hours)
        ders2=@genes[ranD2][ranL2]
        @genes[ranD1][ranL1] = ders2
        @genes[ranD2][ranL2] = ders
      else
        mutation(mRate)
      end
    end

  end

  def fitness
    @score=0
    temp=Hash.new
    @genes.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if temp[modul].nil?
          temp[modul] = 1
        else
          temp[modul] += 1
        end
      end
    end
    @genes.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if !(modul.blank?)
          #Aynı saatteki bütün dersleri bul
          ws = Weeklyschedule.where(day_id:row , lessonhours_id:col)
          cur=Curriculum.find(modul)
          curgrade=cur.departmentlesson.grade
          hour = Departmentlesson.find(cur.departmentlesson_id).hour_amount
          ws.each do |wc|
            #hoca çakışması kontrol
            wsc=wc.curriculum
            if cur.admin.id != wsc.admin.id
              @score = @score + 1
            end
            # elsif #Sınıf çakışması yoksa ve sınıf kontenjanı yetiorsa
            #    @score = @score + 1
            #Aynı sınıfın başka dersi varmı
            if cur.departmentlesson.grade != wsc.departmentlesson.grade
              @score = @score + 1
            end
            if hour == temp[cur.id]
              @score = @score +1
            end
          end
        end
      end
    end
    return @score
  end
end
