package com.bit.shoppingmall.app.dto.cart;

import com.bit.shoppingmall.app.dto.paging.Pagination;
import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class AllCartProductInfoDtoWithPagination {

    private AllCartProductInfoDto cartProductInfoDto;
    private Pagination paging;


    public static AllCartProductInfoDtoWithPagination getCartProductListWithPagination(
            AllCartProductInfoDto cartProductList, Pagination pagination) {
        return AllCartProductInfoDtoWithPagination.builder().cartProductInfoDto(cartProductList)
                .paging(pagination).build();
    }
}
