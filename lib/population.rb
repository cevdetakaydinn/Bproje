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
    @fitness=Hash.new
    @generations=0
  end

  def getpop(i)
    @population[i].getGen
  end
  #bütün populasyonun fitnesslerini hesapla
  def calcFitness
    i=0
    @fitness=Hash.new
    @population.each_with_index do |pop,index|
      @fitness[index] = pop.fitness
    end
    return @fitness
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
    i=nil
    @population.each_with_index do |pop,index|
      fit=pop.fitness
      if(fit>max)
          i=index
          max=fit
      end
    end
    return pop[i]
  end
end
