package com.berg.fastsearch.core.car.service.picture.impl;

import com.berg.fastsearch.core.car.entity.CarPicture;
import com.berg.fastsearch.core.car.repository.CarPictureRepository;
import com.berg.fastsearch.core.car.service.picture.ICarPictureService;
import com.berg.fastsearch.core.car.web.dto.picture.CarPictureDto;
import com.berg.fastsearch.core.car.web.dto.picture.CarPictureQueryCondition;
import com.berg.fastsearch.core.system.base.service.impl.AbstractBaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p></p>
 *
 * @author bergturing@qq.com
 * @version v1.0
 * @apiNote Created on 18-5-10
 */
@Service
public class CarPictureServiceImpl
        extends AbstractBaseServiceImpl<Long, CarPictureDto, CarPicture, CarPictureQueryCondition>
        implements ICarPictureService{

    @Autowired
    private CarPictureRepository carPictureRepository;

    @Override
    protected JpaRepository<CarPicture, Long> getRepository() {
        return carPictureRepository;
    }

    @Override
    protected CarPictureDto createDto() {
        return new CarPictureDto();
    }

    @Override
    protected CarPicture createEntity() {
        return new CarPicture();
    }

    @Override
    protected void transform2E(CarPictureDto dto, CarPicture entity) {
        //如果dto有Id,就设置用于数据的更新
        Long id = dto.getId();
        if(id!=null && id>0){
            //更新
            entity.setId(id);
        }else{
            //新建
        }
    }

    @Override
    public List<CarPictureDto> findByCarId(Long carId) {
        return transform2D(carPictureRepository.findByCarId(carId));
    }
}
