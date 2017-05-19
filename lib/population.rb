class Population
  def initialize(m,popSize,curriculum)
    day=Day.all.size
    hr=Lessonhour.all.size
    @mutationRate=m
    @population=Array.new
    i=0
    while i<popSize
      @population<<Dna.new(curriculum,day,hr)
      i = i+1
    end
    @matingPool=Array.new
    @generations=0
  end

  def getpop(i)
    @population[i].getGen
  end
  #bütün populasyonun fitnesslerini hesapla
  def calcFitness
    i=0
    @population.each do |pop|
      fitness = pop.fitness
    end
  end


  def naturalSelection
    @population.each do |pop|
      #selection yapılacak
    end
  end

  def reproduction
    #crossover (çaprazlana işlemi) yapan fonksiyon
  end

  #en iyi ders programını getir
  def getBest
    max=0
    i=0
    @population.each_with_index do |pop,index|
      if(pop.fitness>max)
          i=index
          max=pop.fitness
      end
    end
    return pop[i]
  end
end
