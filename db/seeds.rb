Product.delete_all
Product.create(
    title: 'Еще один тестовый товар',
    description: %{
        <p>
            Some description of this item... Its can be very long about two line... Or not...
        </p>
    },
    image_url: 'ruby.jpg',
    price: 349.99
    )
Product.create!(
    title: 'Самый первый товар',
    description:
    %{<p>
        Описание товара... Длинное длинное...
    </p>},
    image_url: 'ruby.jpg',
    price: 99.99
)
Product.create!(
    title: 'Другой заголовок',
    description:
    %{<p>
        Описание товара... Длинное длинное...
    </p>},
    image_url: 'ruby.jpg',
    price: 99.99
)
Product.create!(
    title: 'Совсем другой заголовок',
    description:
    %{<p>
        Описание товара... Длинное длинное...
    </p>},
    image_url: 'ruby.jpg',
    price: 99.99
)