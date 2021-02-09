function arrayLength = longestSequence(X)
    my_struct = struct('checking_numb',[],'longest_numbers',[]);
    test_array = X;
    ended= false;
    while true
      did_anything = false;
      for i=1:length(test_array)-1
        if test_array(i) > test_array(i+1)
          did_anything = true;
          temp = test_array(i);
          test_array(i) = test_array(i+1);
          test_array(i+1) = temp;
        end
      end
      if ~did_anything
        break
      end
    end
    counter = 1;
    for i = 1:length(test_array)
        counter = 1;
        my_struct(i).checking_numb = test_array(i);
        my_struct(i).longest_numbers(counter) = my_struct(i).checking_numb;
        counter = counter+1;
        for j = 1:length(test_array)
            if my_struct(i).longest_numbers(length(my_struct(i).longest_numbers))+1 == test_array(j)
                my_struct(i).longest_numbers(counter) = test_array(j);
                counter = counter +1;
            end
        end
    end
    
    maxVal = 0;
    for i = 1:length(my_struct)
        my_struct(i).longest_numbers;
        if length(my_struct(i).longest_numbers) > maxVal
            maxVal = length(my_struct(i).longest_numbers);
        end
    end
    arrayLength = maxVal;
end